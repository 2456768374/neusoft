package com.neusoft.service;

import java.util.List;
import java.util.Map;

public interface HomeService {
    public List<Map<String, Object>> queryForList();

    public List<Map<String, Object>> pie();

    public List<Map<String, Object>> get();
}
