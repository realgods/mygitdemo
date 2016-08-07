package com.framework.demo.service;

import java.util.List;

import com.framework.demo.model.Order;

public interface OrderService {

    public void insertOrder(Order order);

    public Order getOrder(int orderId);

    public List<Order> getOrdersByUsername(String username);

    public int getNextId(String name);

}
