package dev.zakod.plz.booking.service;

import dev.zakod.plz.booking.dto.UserDto;
import dev.zakod.plz.booking.exception.BusinessException;
import dev.zakod.plz.booking.model.User;
import dev.zakod.plz.booking.repository.UserRepository;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public record UserService(UserRepository userRepository,
                          PasswordEncoder passwordEncoder) {

    public void createUser(UserDto userDto) {
        if (userRepository.existsByEmail(userDto.email())) {
            throw new BusinessException();
        }
        userRepository.save(convertToUser(userDto));
    }

    private User convertToUser(UserDto userDto) {
        User user = new User();
        user.setEmail(userDto.email());
        user.setName(userDto.name());
        user.setSurname(userDto.surname());
        user.setPwd(passwordEncoder.encode(userDto.pwd()));
        return user;
    }
}
