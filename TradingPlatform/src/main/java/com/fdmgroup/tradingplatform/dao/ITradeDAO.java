package com.fdmgroup.tradingplatform.dao;

import java.util.List;

import com.fdmgroup.tradingplatform.model.Trade;
import com.fdmgroup.tradingplatform.model.User;

public interface ITradeDAO extends IStorage<Trade> {

	public List<Trade> findTradeByUserName(String userName);

}
