# notes for exercise 2.9

Changes to docker-compose.yml

- build info to point to dockerfile in backend and frontend folder
- added a health check
- removed environment variables listed below

Changes to backend.Dockerfile

- changed the REQUEST_ORIGIN to http://frontend

Changes to frontend.Dockerfile

- changed the REACT_APP_BACKEND_URL to http://nginx/api/ping (so it goes through the proxy, not directly to the backend)
