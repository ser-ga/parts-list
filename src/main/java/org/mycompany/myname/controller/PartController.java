package org.mycompany.myname.controller;

import org.mycompany.myname.model.Part;
import org.mycompany.myname.service.PartService;
import org.mycompany.myname.util.Pagination;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

/**
 * @author Sergey Zhukov
 * @version 1.0
 */

@Controller
public class PartController {

    @Autowired
    @Qualifier(value = "partService")
    private PartService partService;

    public void setPartService(PartService partService) {
        this.partService = partService;
    }

    @RequestMapping(value = "parts", method = RequestMethod.GET)
    public String listParts(@RequestParam(value = "page", required = false) Integer page,
                            @RequestParam(value = "bind", required = false) Boolean bind,
                            Model model) {
        Integer currentPage = 0;
        int perPage = 10;
        if (page != null && page > 0) currentPage = page;
        int count = this.partService.countParts(bind);
        if (count > 10 && bind == null)
            model.addAttribute("pagin", Pagination.pagin(count, currentPage, perPage));
        if (count > 10 && bind != null)
            model.addAttribute("pagin", Pagination.pagin(count, currentPage, bind, perPage));
        model.addAttribute("part", new Part());
        model.addAttribute("listParts", this.partService.listParts(currentPage, bind));
        model.addAttribute("countBind", this.partService.countBind());
        model.addAttribute("pageNumber", currentPage);
        model.addAttribute("perPage", perPage);
        return "parts";
    }

    @RequestMapping(value = "/parts/add", method = RequestMethod.POST)
    public String addPart(@ModelAttribute("part") Part part) {
        if (part.getId() == 0) {
            this.partService.addPart(part);
        }
        return "redirect:/parts";
    }

    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
    public String editPart(@PathVariable("id") int id, Model model) {
        model.addAttribute("part", this.partService.getPartById(id));
        return "edit";
    }

    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    public String editPart(@ModelAttribute("part") Part part) {
        if (part.getId() != 0) {
            this.partService.updatePart(part);
        }
        return "edit";

    }

    @RequestMapping(value = "/remove/{id}", method = RequestMethod.GET)
    public String removePart(@PathVariable("id") int id) {
        this.partService.removePart(id);
        return "redirect:/parts";
    }

    @RequestMapping(value = "/search", method = RequestMethod.POST)
    public String searchParts(@ModelAttribute("query") String query, Model model) {
        model.addAttribute("listParts", this.partService.search(query));
        model.addAttribute("query", query);
        return "search";
    }

}
