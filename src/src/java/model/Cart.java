/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author dangv
 */
public class Cart {

    private HashMap<Long, Item> cartItems;//Map là một tập các cặp khóa - giá trị (key - value). 
    //Đối với Map Interface có Class triển khai là HashMap thì thứ tự các phần tử không dựa theo thứ tự lúc thêm vào

    public Cart() {
        cartItems = new HashMap<>();
    }

    public Cart(HashMap<Long, Item> cartItems) {
        this.cartItems = cartItems;
    }

    public HashMap<Long, Item> getCartItems() {
        return cartItems;
    }

    public void setCartItems(HashMap<Long, Item> cartItems) {
        this.cartItems = cartItems;
    }

    //insert
    public void plusToCart(Long key, Item item) {
        boolean check = cartItems.containsKey(key);
        if (check) {
            int quantity_old = item.getQuantity();
            item.setQuantity(quantity_old + 1);
            cartItems.put(key, item);
        } else {
            cartItems.put(key, item);
        }
    }

    //sub to cart
    public void subToCart(Long key, Item item) {
        boolean check = cartItems.containsKey(key);
        if (check) {
            int quantity_old = item.getQuantity();
            if (quantity_old <= 1) {
                cartItems.remove(key);
            } else {
                item.setQuantity(quantity_old - 1);
                cartItems.put(key, item);
            }
        }
    }

    //remove
    public void removeToCart(Long key) {
        boolean check = cartItems.containsKey(key);
        if (check) {
            cartItems.remove(key);
        }
    }

    //tong sp
    public int countItem() {
        return cartItems.size();
    }

    //tong tien
    public double totalCart() {
        float count = 0;
        //=gia*soluong
        for (Map.Entry<Long, Item> list : cartItems.entrySet()) {
            
            count=count+  list.getValue().getLaptop().getGia() *list.getValue().getQuantity();
        }
        return count;
    }
}
