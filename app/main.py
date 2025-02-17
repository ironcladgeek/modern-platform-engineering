from flask import Flask, jsonify

app = Flask(__name__)


@app.route("/health")
def health_check():
    return jsonify({"status": "healthy"})


@app.route("/")
def hello_world():
    # return jsonify({"message": "Hello World!"})
    return jsonify({"message": "Hello from Bionic Woman!"})


@app.route("/echo/<message>")
def echo(message):
    return jsonify({"message": message})


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8080)
