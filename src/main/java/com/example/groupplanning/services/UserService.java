package com.example.groupplanning.services;

import com.example.groupplanning.models.LoginUser;
import com.example.groupplanning.models.User;
import com.example.groupplanning.repositories.UserRepository;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import javax.swing.text.html.Option;
import java.util.List;
import java.util.Optional;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepo;

    public User register(User newUser, BindingResult result) {
        Optional<User> optionalUser = userRepo.findByEmail(newUser.getEmail());
        if (optionalUser.isPresent()){
            result.rejectValue("email", "unique", "Email is already registered");
        }
        if (!newUser.getPassword().equals(newUser.getConfirm())){
            result.rejectValue("confirm", "matches", "Passwords do not match");
        }
        if (result.hasErrors()){
            return null;
        }
        String hashed = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
        newUser.setPassword(hashed);
        return userRepo.save(newUser);
    }
    public User login(LoginUser newLogin, BindingResult result) {
        Optional<User> optionalUser = userRepo.findByEmail(newLogin.getEmail());
        if(!optionalUser.isPresent()){
            result.rejectValue("email", "unique", "Please register first");
        }
        if(result.hasErrors()){
            return null;
        }
        User user = optionalUser.get();
        if(!BCrypt.checkpw(newLogin.getPassword(), user.getPassword())){
            result.rejectValue("password", "Matches", "Invalid Password");
        }
        if (result.hasErrors()){
            return null;
        }
        return user;
    }

    public User findUser(Long id){
        Optional<User> optionalUser = userRepo.findById(id);
        if(optionalUser.isPresent()) {
            return optionalUser.get();
        } else {
            return null;
        }
    }

    public List<User> allUsers(){
        return userRepo.findAll();
    }
}
