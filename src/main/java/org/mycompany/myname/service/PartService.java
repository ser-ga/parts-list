package org.mycompany.myname.service;

import org.mycompany.myname.model.Part;

import java.util.List;

/**
 * @author Sergey Zhukov
 * @version 1.0
 */


public interface PartService {
    void addPart(Part part);
    void updatePart(Part part);
    void removePart(int id);
    Part getPartById(int id);
    List<Part> listParts(Integer page, Boolean bind);
    int countParts(Boolean bind);
    List<Part> search(String query);
    long countBind();
}
