package brandon.burgertracker.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import brandon.burgertracker.models.Burger;
import brandon.burgertracker.repositories.BurgerRepository;

@Service
public class BurgerService {

    @Autowired
    BurgerRepository burgerRepository;

    // Create Burger
    public void createBurger(Burger burger) {
        burgerRepository.save(burger);
    }
    //Read One Burger
    public Burger getOneBurger(Long id){
        Optional<Burger> optionalBurger = burgerRepository.findById(id);
        return optionalBurger.orElse(null);
    }
    //Read all Burgers
    public List<Burger> allBurgers() {
        return burgerRepository.findAll();
    }
    //Update Burger
    public void updateBurger(Burger burger) {
        burgerRepository.save(burger);
    }

    //Delete burger
    public void deleteBurger(Burger burger) {
        burgerRepository.delete(burger);
    }
}
