import React, { useState } from "react";
import { Inertia } from "@inertiajs/inertia";
import { usePage } from "@inertiajs/inertia-react";
import { List, ListItem } from "@material-ui/core";
import Routes from "../routes.js.erb";

export default function Cart() {
  const { cart } = usePage().props

  return (
    <List>
      {cart.map((product, quantity) => (
        <ListItem key={product.id}>
          <CartItem product={product} quantity={quantity} />
        </ListItem>
      ))}
    </List>
  );
};
