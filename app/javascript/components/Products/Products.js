import React, { useState } from "react";
import { Inertia } from "@inertiajs/inertia";
import Product from "./Product"
import { List, ListItem } from "@material-ui/core";

const Products = ({ products }) => {

  return (
    <List>
      {products.map((product) => (
        <ListItem key={product.id}>
          <Product product={product} />
        </ListItem>
      ))}
    </List>
  );
};

export default Products;