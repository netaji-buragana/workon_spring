package com.netaji.eNum;

import java.util.HashMap;

import java.util.Map;

public enum AddressType {
	home(1,"HOME"), office(2, "OFFICE");

	private final Integer key;
	private final String value;
	private static Map<Integer, AddressType> map;
	
	static {
		map = new HashMap<>();
		for(AddressType addressType: AddressType.values()) {
			map.put(addressType.getKey(), addressType);
		}
		
	}

	AddressType(Integer key, String value) {
		this.key = key;
		this.value = value;
	}

	public Integer getKey() {
		return key;
	}

	public String getValue() {
		return value;
	}
	
	
	
	public static String getAddressTypeName(Integer typeId) {			
		return map.get(typeId).getValue();
	}

}
