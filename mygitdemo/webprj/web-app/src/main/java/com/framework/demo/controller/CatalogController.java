package com.framework.demo.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.framework.demo.model.Category;
import com.framework.demo.model.Item;
import com.framework.demo.model.Product;
import org.springframework.web.bind.annotation.RequestMethod;
import com.framework.demo.service.CatalogService;

@Controller  /*  定义控制器   */
@RequestMapping(value={"/catalog"}, produces={"text/html;charset=UTF-8"})   /*  作用在类级别时，表明控制器处理所有的请求都被映射到/catalog路径下   */
public class CatalogController {

    private static final long serialVersionUID = 5849523372175050635L;

	private static final String MAIN = "/catalog/Main";
	private static final String SEARCH_PRODUCTS = "/catalog/SearchProducts";
	private static final String VIEW_CATEGORY = "/catalog/Category";
	private static final String VIEW_PRODUCT = "/catalog/Product";
	
	private static final String VIEW_ITEM = "/WEB-INF/jsp/catalog/Item.jsp";

    @Autowired
	private transient CatalogService catalogService;

    @RequestMapping(value="/", method={RequestMethod.GET})
	public String viewMain() {
		return MAIN;
	}

	@RequestMapping(value="/viewCategory", method={RequestMethod.GET})
	public String viewCategory(String categoryId, ModelMap outputModel) {
		if (!StringUtils.isBlank(categoryId)) {
			List<Product> productList = catalogService.getProductListByCategory(categoryId);
			Category category = catalogService.getCategory(categoryId);
			outputModel.addAttribute("productList", productList);
			outputModel.addAttribute("category", category);
		}
		return VIEW_CATEGORY;
	}
    
	@RequestMapping(value="/search", method={RequestMethod.GET})
	public String searchProducts(String keyword, ModelMap outputMdlmap) {
		if (StringUtils.isBlank(keyword)) {
			outputMdlmap.addAttribute("errors", "Please enter a keyword to search for, then press the search button.");
			return SEARCH_PRODUCTS;
		} else {
			List<Product> list = catalogService.searchProductList(keyword.trim().toLowerCase());
			outputMdlmap.addAttribute("productList", list);
			return SEARCH_PRODUCTS;
		}
	}

	@RequestMapping(value="/viewProduct", method={RequestMethod.GET})
	public String viewProduct(String productId, ModelMap outputMdlmap) {
		if (productId != null) {
			List<Item> itemList = catalogService.getItemListByProduct(productId);
			Product product = catalogService.getProduct(productId);
			outputMdlmap.addAttribute("itemList", itemList);
			outputMdlmap.addAttribute("product", product);
		}
		return VIEW_PRODUCT;
	}

}
