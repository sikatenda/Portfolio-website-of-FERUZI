const { setGlobalOptions } = require("firebase-functions");
const { onRequest } = require("firebase-functions/https");

setGlobalOptions({ maxInstances: 10 });

exports.corsProxy = onRequest(
  {
    cors: true,
  },
  async (req, res) => {
    try {
      const targetUrl = req.query.url;

      if (!targetUrl) {
        return res.status(400).send("Missing url parameter");
      }

      const response = await fetch(targetUrl);

      if (!response.ok) {
        return res
          .status(response.status)
          .send(`Failed to fetch image: ${response.statusText}`);
      }

      const contentType =
        response.headers.get("content-type") || "application/octet-stream";

      const buffer = Buffer.from(await response.arrayBuffer());

      res.set("Content-Type", contentType);
      res.set("Cache-Control", "public, max-age=3600");

      return res.status(200).send(buffer);
    } catch (error) {
      console.error("corsProxy error:", error);
      return res.status(500).send("Proxy request failed");
    }
  }
);