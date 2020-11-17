import React, { useState } from "react";
import { Inertia } from "@inertiajs/inertia";

const Product = ({ product }) => {

  return (
    <h1>{product.name}</h1>
  );
};

export default Product;