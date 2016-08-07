package com.framework.demo.service;

import java.util.List;

import com.framework.demo.model.Category;
import com.framework.demo.model.Item;
import com.framework.demo.model.Product;

public interface CatalogService {

    public List<Category> getCategoryList();

    public Category getCategory(String categoryId);

    public Product getProduct(String productId);

    public List<Product> getProductListByCategory(String categoryId);

    public List<Product> searchProductList(String keywords);

    public List<Item> getItemListByProduct(String productId);

    public Item getItem(String itemId);

    public boolean isItemInStock(String itemId);

}