package com.rengu.util;

import java.util.List;

/**
 * Created by hanchangming on 2017/5/22.
 */
public interface SuperDAO {
    boolean save(Object object);

    boolean delete(Object object);

    boolean update(Object object);

    List<?> findAll();

    List<?> findAllByUsername(Object object);
}