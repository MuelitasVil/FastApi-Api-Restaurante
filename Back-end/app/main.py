from fastapi import FastAPI
from app.config import APP_CONFIG
from app.routers import RouteLibro
from fastapi.middleware.cors import CORSMiddleware

app = FastAPI(**APP_CONFIG)

# App origins access
origins = ["http://localhost:3000"] 

app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,  # Permitir solicitudes desde http://localhost:3000
    allow_credentials=True,
    allow_methods=["*"],  # Permitir todos los métodos HTTP (GET, POST, etc.)
    allow_headers=["*"],  # Permitir todas las cabeceras
)

# Root/Index path
@app.get("/", tags=["index"])
async def index() -> dict:
    return {"api": "Inicio"}

# Routes App
app.include_router(RouteLibro)