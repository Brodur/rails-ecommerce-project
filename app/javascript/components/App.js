import React from "react";
import Cart from "./Cart";
import Products from "./Products";

export default function App(props) {
  return (
    <>
      <Cart/>
      <main>
        <Products products={props.products} />
      </main>
    </>
  );
}