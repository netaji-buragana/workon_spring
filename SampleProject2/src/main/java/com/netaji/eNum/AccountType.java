package com.netaji.eNum;

import java.util.HashMap;

import java.util.Map;

public enum AccountType {
	SAVING(1,"SAVING"), CURRENT(2, "CURRENT");

	private final Integer key;
	private final String value;
	private static Map<Integer, AccountType> map;
	
	static {
		map = new HashMap<>();
		for(AccountType accountType: values()) {
			map.put(accountType.getKey(), accountType);
		}
		
	}

	AccountType(Integer key, String value) {
		this.key = key;
		this.value = value;
	}

	public Integer getKey() {
		return key;
	}

	public String getValue() {
		return value;
	}
	
	
	
	public static String getAcccountTypeName(Integer accountType) {			
		return map.get(accountType).getValue();
	}

}
