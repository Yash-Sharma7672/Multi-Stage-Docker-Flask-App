from flask import Flask

app = Flask(__name__)

@app.route("/")
def home():
    return "🔥 Dockerized Flask App - Production Ready (Multi-Stage Build) 🔥"

if __name__ == "__main__":
    # For development only; production uses Gunicorn
    app.run(host="0.0.0.0", port=5000)
