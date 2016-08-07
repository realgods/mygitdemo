package com.framework.demo.controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributesModelMap;

import com.framework.demo.model.Account;
import com.framework.demo.service.AccountService;


@Controller  /*  定义控制器   */
@RequestMapping(value={"/account"}, produces={"text/html;charset=UTF-8"})   /*  作用在类级别时，表明控制器处理所有的请求都被映射到/account路径下   */
public class AccountController {

    private static final long serialVersionUID = 5499663666155758178L;

	private static final String NEW_ACCOUNT = "/account/newAccountForm";
	private static final String EDIT_ACCOUNT = "/WEB-INF/jsp/account/EditAccountForm.jsp";
	private static final String SIGNON = "/WEB-INF/jsp/account/SignonForm.jsp";

    @Autowired
	private transient AccountService accountService;
    //@Autowired
	//private transient CatalogService catalogService;

	@RequestMapping(value="/newAccountForm", method={RequestMethod.GET})
	public String newAccountForm() {
		System.out.println("newAccountForm()");
		return NEW_ACCOUNT;
	}
	
	@RequestMapping(value="/newAccount", method={RequestMethod.POST})
	public String newAccount(@Valid Account account, BindingResult result, RedirectAttributesModelMap outputModel) {
		System.out.println("姓名: " + account.getRealName());
		if (result.hasErrors()) {
			System.out.println("表单校验失败:" + result.getAllErrors().size() + "项");
			outputModel.addFlashAttribute("errors", result);
			return "redirect:" + NEW_ACCOUNT;
		}
		accountService.insertAccount(account);
		account = accountService.getAccount(account.getUsername());
		// myList = catalogService.getProductListByCategory(account.getFavouriteCategoryId());
		// authenticated = true;

		return "redirect:" + NEW_ACCOUNT;
	}

	@RequestMapping(value="/editAccountForm", method={RequestMethod.GET})
	public String editAccountForm() {
		System.out.println("editAccountForm()");
		return EDIT_ACCOUNT;
	}


}
