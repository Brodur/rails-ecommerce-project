import React, { useState } from "react";
import { Inertia } from "@inertiajs/inertia";
import { Button, ButtonGroup, InputBase } from "@material-ui/core";

const Product = ({ product }) => {
  const [quantity, setQuantity] = useState("");

  function addItem(event){
    console.log(event)
    event.preventDefault();
    Inertia.post("/carts/add_to_cart/" + product.id, {
        quantity: quantity
    });
  }

  function handleChange(event){
    setQuantity(event.target.value)
  }

  return (
    <>
      <h3>{product.name}</h3>
      <p>UPC: {product.upc}</p>
      <p>On hand: {product.on_hand}</p>
      <p>Price: {product.price}</p>
      <p>Description: {product.description}</p>
      <form onSubmit={addItem}>
        <InputBase id="quantity" type="number" defaultValue="1" inputProps={{
          "min":1,
          "max": product.on_hand,
          "default": 1
          }}
          onChange={handleChange}/>
        <Button id="product" color="primary" type="submit" value={product.id}>Add to Cart</Button>
      </form>
    </>
  );
};

export default Product;