import React, { useState } from "react";
import { Inertia } from "@inertiajs/inertia";

const CartItem = ({ product, quantity }) => {

  return (
    <>
      {product.name}
      <InertiaLink
        href={Routes.remove_from_cart(product.id)}
        method="delete"
        >
          ❌
        </InertiaLink>
    </>
  );
};

export default CartItem;