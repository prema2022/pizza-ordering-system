package net.pizza.dao;

import java.util.ArrayList;
import java.util.List;

import net.pizza.model.CartItem;

public class CartDAO {
    private List<CartItem> cartItems = new ArrayList<>();

    public void addToCart(CartItem cartItem) {
        cartItems.add(cartItem);
    }

    public void removeFromCart(int pizzaId) {
        cartItems.removeIf(item -> item.getPizza().getPizzaId() == pizzaId);
    }

    public List<CartItem> getCartItems() {
        return cartItems;
    }

    public double calculateTotal() {
        return cartItems.stream().mapToDouble(CartItem::getTotalPrice).sum();
    }
}
