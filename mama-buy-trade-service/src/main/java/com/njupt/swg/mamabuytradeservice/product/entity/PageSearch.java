package com.njupt.swg.mamabuytradeservice.product.entity;

import lombok.Data;

/**
 * Created by JackWang<coder520.com>
 *
 * @Date 21:26 2018/3/19
 */
@Data
public class PageSearch {

    private int pageNumber;
    private int pageSize;
    private String searchContent;

}
