import React, { useState } from "react";
import { Inertia } from "@inertiajs/inertia";
import Product from "./Product"
import { List, ListItem } from "@material-ui/core";

const Products = ({ products }) => {

  return (
    <>
      {products.map((product) => (
          <Product product={product} key={product.id}/>
      ))}
    </>
  );
};

export default Products;