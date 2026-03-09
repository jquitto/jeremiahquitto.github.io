from flask import Flask, jsonify
import os

app = Flask(__name__)

@app.get("/")
def index():
    return jsonify({"service": "sre-sample-app", "status": "ok"})

@app.get("/health")
def health():
    return jsonify({"status": "healthy"}), 200

@app.get("/ready")
def ready():
    # In real scenarios check dependencies (DB, cache, downstream)
    return jsonify({"status": "ready"}), 200

if __name__ == "__main__":
    port = int(os.getenv("PORT", 8080))
    app.run(host="0.0.0.0", port=port)
