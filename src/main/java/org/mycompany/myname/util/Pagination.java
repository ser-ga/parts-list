package org.mycompany.myname.util;

import java.util.ArrayList;
import java.util.List;

/**
 * @author Sergey Zhukov
 * @version 1.0
 */

public class Pagination {

    public static List<String> pagin(int count, int current, boolean bind, int perPage) {
        List<String> list = new ArrayList<>();
        int countOfPages = 0;
        if (count % perPage == 0) countOfPages = count / perPage;
        else countOfPages = count / perPage + 1;
        for (int i = 0; i < countOfPages; i++) {
            if (i == current) list.add("");
            else {
                StringBuilder sb = new StringBuilder();
                sb.append("?page=")
                        .append(i)
                        .append("&bind=")
                        .append(bind);
                list.add(sb.toString());
            }
        }
        return list;
    }

    public static List<String> pagin(int count, int current, int perPage) {
        List<String> list = new ArrayList<>();
        int countOfPages = 0;
        if (count % perPage == 0) countOfPages = count / perPage;
        else countOfPages = count / perPage + 1;
        for (int i = 0; i < countOfPages; i++) {
            if (i == current) list.add("");
            else {
                StringBuilder sb = new StringBuilder();
                sb.append("?page=")
                        .append(i);
                list.add(sb.toString());
            }
        }
        return list;
    }

}
