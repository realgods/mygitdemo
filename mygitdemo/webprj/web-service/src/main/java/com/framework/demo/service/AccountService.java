package com.framework.demo.service;

import com.framework.demo.model.Account;

public interface AccountService {

	public Account getAccount(String username);

	public Account getAccount(String username, String password);

	public void insertAccount(Account account);

	public void updateAccount(Account account);

}
