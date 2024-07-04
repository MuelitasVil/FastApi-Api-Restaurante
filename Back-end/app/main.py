from fastapi import FastAPI
from app.config import APP_CONFIG
from app.routers import RouteLibro
from fastapi.middleware.cors import CORSMiddleware

app = FastAPI(**APP_CONFIG)

# App origins access
origins = ["http://localhost:5000"]
app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=origins,
    allow_headers=origins,
)

# Root/Index path
@app.get("/", tags=["index"])
async def index() -> dict:
    return {"api": "Inicio"}

# Routes App
app.include_router(RouteLibro)