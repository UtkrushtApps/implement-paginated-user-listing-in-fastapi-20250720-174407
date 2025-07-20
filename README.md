Task Overview

You are provided with a micro-service that should expose a paginated list of users but is currently failing on both request validation and containerization. Your goal is to correct the API so it accepts integer pagination parameters and ensure it runs inside a container that meets internal virtual-environment policies.

Guidance

• Investigate the query parameter validation that is causing the HTTP 422 response.
• Review type hints and FastAPI helpers available for parameter constraints.
• Ensure the container builds, installs dependencies inside an isolated environment, and exposes the service correctly.
• Verify that the service responds properly to pagination requests once fixed.

Objectives

• Resolve the validation error so requests to the items endpoint with limit and offset integers return HTTP 200.
• Implement or adjust containerization to create and use a Python virtual environment during build and runtime.
• Confirm the service starts, exposes port 8000, and returns the expected JSON payload for valid queries.

How to Verify

• Send a GET request to /items with limit and offset parameters and confirm an HTTP 200 response with the expected list.
• Build and run the container, ensuring the application uses the internal virtual environment.
• Validate that automated or manual health checks against the endpoint succeed without errors.