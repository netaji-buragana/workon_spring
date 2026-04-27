package com.netaji.repository;

import java.io.Serializable;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.netaji.entity.AccountEntity;
import com.netaji.entity.AddressEntity;

@Repository
public interface AccountRepository extends JpaRepository<AccountEntity, Serializable> {

}
