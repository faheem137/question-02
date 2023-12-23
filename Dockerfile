# Use the official Python image as the base image
FROM python:3.9-slim-buster

# Set the working directory within the container
WORKDIR /docker

# Copy your cv.html file from the templates directory into the container
COPY templates/checkout.html /docker/

# Install Flask
RUN pip install Flask

# Create a Python script to serve the HTML file using Flask
RUN echo 'from flask import Flask\napp = Flask(__name__)\n\n@app.route("/")\ndef hello():\n    return open("checkout.html", "r").read()\n\nif __name__ == "__main__":\n    app.run(host="0.0.0.0", port=80)' > app.py

# Expose port 80 (the default HTTP port) to the host
EXPOSE 80

# Command to start the Flask application
CMD ["python", "app.py"]