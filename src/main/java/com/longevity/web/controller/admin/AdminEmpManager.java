package com.longevity.web.controller.admin;

import com.longevity.web.domain.users.Employee;
import com.longevity.web.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

@Controller
@PreAuthorize("hasAuthority('ADMIN')")
@RequestMapping("/admin/empl")
public class AdminEmpManager{
    private EmployeeService employeeService;
    @Autowired
    public AdminEmpManager(EmployeeService employeeService) {
        this.employeeService = employeeService;
    }

    @GetMapping("/all")
    public String getAllEmployee(Model model){
        //model.addAttribute("employees", employeeService.getAllEmployees());
        //return "admin/employees";
        return findPaginatedUsers(1, model);
    }

    @GetMapping("/{id}")
    public String getEmployee(@PathVariable(name = "id") Employee employee, Model model){
        if (employee != null){
            model.addAttribute("employee", employee);
            return "admin/employee";
        }
        return "admin/employees";
    }


    @GetMapping("/{id}/update")
    public String updateEmployee(@PathVariable(name = "id") Employee employee, @RequestParam Map<String, String> form){
        employeeService.updateEmployee(employee, form);
        return null;
    }

    @GetMapping("/{id}/delete")
    public String deleteEmployee(@PathVariable(name = "id") Employee employee){
        if(employee != null)
            employeeService.deleteEmployee(employee);
        return "redirect:/admin/empl/all";
    }

    @GetMapping("/all/pageus/{pageNo}")
    public String findPaginatedUsers(@PathVariable("pageNo") int pageNo, Model model) {
        int pageSize = 5;

        Page<Employee> page = employeeService.findPaginate(pageNo, pageSize);

        model.addAttribute("currentPage", pageNo);
        model.addAttribute("totalPages", page.getTotalPages());
        model.addAttribute("totalItems", page.getTotalElements());
        model.addAttribute("employees", page.getContent());

        return "admin/employees";
    }


}
