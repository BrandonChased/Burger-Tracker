package brandon.burgertracker.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import brandon.burgertracker.models.Burger;
import brandon.burgertracker.services.BurgerService;

@Controller
public class MainControllers {

    @Autowired
    BurgerService burgerService;

    // Read All
    @RequestMapping("/")
    public String index(@ModelAttribute("burgers") Burger burgers, Model model) {
        List<Burger> burger = burgerService.allBurgers();
        model.addAttribute("burger", burger);
        return "index.jsp";
    }

    // Create burger
    @PostMapping("/burgers")
    public String newBurger(
            @Valid @ModelAttribute("burgers") Burger burger,
            BindingResult result) {
        burgerService.createBurger(burger);
        return "redirect:/";

    }

    // Edit a burger Page
    @GetMapping("/burgers/edit/{id}")
    public String edit(@PathVariable("id") Long id, Model model) {
        Burger burger = burgerService.getOneBurger(id);
        model.addAttribute("burger", burger);
        return "edit.jsp";
    }

    // Edit Burger in database
    @PutMapping("/edit/{id}")
    public String update(@PathVariable("id") Long id,@ModelAttribute("burger") Burger burger) {
            burgerService.updateBurger(burger);
            return "redirect:/";
    }

    // Delete Burger in database
    @DeleteMapping("/burgers/{id}")
    public String destroy(@PathVariable("id") Long id) {
        Burger burger = burgerService.getOneBurger(id);
        burgerService.deleteBurger(burger);
        return "redirect:/";
    }
}
