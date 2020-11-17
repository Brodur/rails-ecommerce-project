import React, { useState } from "react";
import { Inertia } from "@inertiajs/inertia";
import Product from "./Product"
import { List, ListItem } from "@material-ui/core";

const Products = ({ products }) => {

  return (
    <List>
      {products.map((product) => (
        <ListItem>
          <Product product={product} key={product.id}/>
        </ListItem>
      ))}
    </List>
  );
};

export default Products;