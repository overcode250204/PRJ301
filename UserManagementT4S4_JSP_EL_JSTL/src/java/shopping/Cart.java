/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package shopping;

import model.ProductDTO;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author ACER
 */
public class Cart {
    private Map<String, ProductDTO> cart;
    

    public Cart() {
    }

    public Cart(Map<String, ProductDTO> cart) {
        this.cart = cart;
    }

    public Map<String, ProductDTO> getCart() {
        return cart;
    }

    public void setCart(Map<String, ProductDTO> cart) {
        this.cart = cart;
    }

    public boolean add(ProductDTO product) {
        boolean check = false;
        try {
            if (this.cart == null) {
                this.cart = new HashMap<>();               
            }
            if (this.cart.containsKey(product.getId())) {
                int currentQuantity = this.cart.get(product.getId()).getQuantity();
                product.setQuantity(currentQuantity + product.getQuantity());
            }
            this.cart.put(product.getId(), product);
            check = true;
            
        } catch (Exception e) {
            
        }
        
        return check;
    }

    public boolean edit(String id, int quantity) {
        boolean result = false;
        try {
            if (this.cart != null) {
                if (this.cart.containsKey(id)) {
                    this.cart.get(id).setQuantity(quantity);
                    result = true;
                }
                
                
            }
        } catch (Exception e) {
            
        }
        
        
        
        
        return result;
    }

    public boolean remove(String id) {
        boolean result = false;
        try {
            if (this.cart != null) {
                if (this.cart.containsKey(id)) {
                    this.cart.remove(id);
                    result = true;
                }
            }
        } catch (Exception e) {
            
        }
        
        
        
        return result;
    }
    
    
    public double getTotalPrice() {
        double total = 0;
        try {
            if (this.cart != null) {
                for (ProductDTO product : this.cart.values()) {
                    total += product.getPrice() * product.getQuantity();
                }
            }
        } catch (Exception e) {
            
        }
        
        return total;
    }
    
    
}
