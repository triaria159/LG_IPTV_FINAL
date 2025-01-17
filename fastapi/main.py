import os
from fastapi import FastAPI
from fastapi.staticfiles import StaticFiles
from fastapi.responses import FileResponse
from config import engine, Base
from routers import user, detail

app = FastAPI()

# Create database tables
Base.metadata.create_all(bind=engine)

# Include routers
app.include_router(user.router)
app.include_router(detail.router)

# 현재 파일(app.py)이 위치한 디렉토리 경로
current_dir = os.path.dirname(os.path.abspath(__file__))

# Static 파일 경로
static_dir = os.path.join(current_dir, "static", "build")

# Serve static files
app.mount(
    "/static",
    StaticFiles(directory=static_dir),
    name="static",
)

# Serve Svelte index.html
@app.get("/")
async def serve_index():
    index_file_path = os.path.join(static_dir, "index.html")
    return FileResponse(index_file_path)