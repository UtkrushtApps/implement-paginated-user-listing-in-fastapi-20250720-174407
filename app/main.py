from typing import List

from fastapi import FastAPI, Query
from pydantic import BaseModel


class Item(BaseModel):
    id: int
    name: str


# Dummy in-memory dataset for demonstration purposes
items_db = [Item(id=i, name=f"Item {i}") for i in range(1, 101)]

app = FastAPI(title="Paginated Items Service")


@app.get("/items", response_model=List[Item])
def list_items(
    limit: int = Query(10, ge=1, le=100, description="Number of items to return"),
    offset: int = Query(0, ge=0, description="Number of items to skip before starting selection"),
):
    """Return a slice of items based on limit and offset query params."""
    return items_db[offset : offset + limit]
