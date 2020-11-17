import React, { useState } from "react";
import { Inertia } from "@inertiajs/inertia";

const Cart = ({ cartItems }) => {

  return (
    <List>
      {products.map((product) => (
        <ListItem key={product.id}>
          <CartItem product={product} />
        </ListItem>
      ))}
    </List>
  );
};

export default Cart;