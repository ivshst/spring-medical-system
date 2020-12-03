package com.longevity.web.controller.Employee;

import com.longevity.web.domain.branch.Branch;
import com.longevity.web.domain.scripts.ScriptGroup;
import com.longevity.web.service.scripts.ScriptGroupService;
import org.springframework.data.domain.Page;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@PreAuthorize("hasAnyAuthority('ADMIN','EMPLOYEE')")
//TODO роль 'EMPLOYEE' сменить на нужную роль
@RequestMapping("/employee/script_group")
public class EmployeeScriptGroup {
    private ScriptGroupService scriptGroupService;

    public EmployeeScriptGroup(ScriptGroupService scriptGroupService) {
        this.scriptGroupService = scriptGroupService;
    }


    @GetMapping("all")
    public String getAllScriptGroup(Model model){
        //model.addAttribute("groups", scriptGroupService.findAll());
        //return "employee/script/groups";
        return findPaginatedGroups(1, model);
    }

    @GetMapping("{id}")
    public String getScriptGroupById(@PathVariable(name = "id") ScriptGroup scriptGroup, Model model ){
        System.out.println();
        model.addAttribute("group", scriptGroup);
        return "employee/script/group";
    }

    @PostMapping("add")
    public String addScriptGroup(@RequestParam String name){
        scriptGroupService.add(name);
        return "redirect:/employee/script_group/all";
    }

    @PostMapping("{id}/update")
    public String updateScriptGroup(@PathVariable(name = "id") ScriptGroup scriptGroup, @RequestParam String name){
        scriptGroupService.update(scriptGroup, name);
        return "redirect:/employee/script_group/"+scriptGroup.getId();
    }

    @GetMapping("{id}/delete")
    public String deleteScriptGroupById(@PathVariable(name = "id") ScriptGroup scriptGroup){
        scriptGroupService.delete(scriptGroup);
        return "redirect:/employee/script_group/all";
    }

    @GetMapping("/all/pageus/{pageNo}")
    public String findPaginatedGroups(@PathVariable("pageNo") int pageNo, Model model) {
        int pageSize = 5;

        Page<ScriptGroup> page = scriptGroupService.findPaginate(pageNo, pageSize);

        model.addAttribute("currentPage", pageNo);
        model.addAttribute("totalPages", page.getTotalPages());
        model.addAttribute("totalItems", page.getTotalElements());
        model.addAttribute("groups", page.getContent());

        return "employee/script/groups";
    }

}

