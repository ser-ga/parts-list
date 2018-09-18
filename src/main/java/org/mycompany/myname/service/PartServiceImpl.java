package org.mycompany.myname.service;

import org.mycompany.myname.dao.PartDao;
import org.mycompany.myname.model.Part;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author Sergey Zhukov
 * @version 1.0
 */

@Service
@Transactional
public class PartServiceImpl implements PartService {

    @Autowired
    private PartDao partDao;

    @Override
    public void addPart(Part part) {
        this.partDao.addPart(part);
    }

    @Override
    public void updatePart(Part part) {
        this.partDao.updatePart(part);
    }

    @Override
    public void removePart(int id) {
        this.partDao.removePart(id);
    }

    @Override
    public Part getPartById(int id) {
        return this.partDao.getPartById(id);
    }

    @Override
    public List<Part> listParts(Integer page, Boolean bind) {
        return this.partDao.listParts(page, bind);
    }

    @Override
    public int countParts(Boolean bind) {
        return this.partDao.countParts(bind);
    }

    @Override
    public List<Part> search(String query) {
        return this.partDao.search(query);
    }

    @Override
    public long countBind() {
        return this.partDao.countBind();
    }
}
