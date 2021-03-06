package com.rengu.DAO;

import java.util.List;

/**
 * Created by hanchangming on 2017/6/13.
 */
public interface ProviderDAO<T> extends SuperDAO {
    List<T> findAll();

    List<T> findAllByUsername(String username);

    T findAllById(String id);

    List<T> search(String keyWord);
}
