package pl.coderslab.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pl.coderslab.models.Role;
import pl.coderslab.repositories.RoleRepository;

import javax.transaction.Transactional;

@Service
@Transactional
public class RoleServiceImpl implements RoleService<Role> {

    @Autowired
    RoleRepository roleRepository;

    @Override
    public Role findByRoleName(String roleName) {
        return roleRepository.findRoleByRole(roleName);
    }
}
