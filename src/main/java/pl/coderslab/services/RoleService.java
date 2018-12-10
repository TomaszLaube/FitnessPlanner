package pl.coderslab.services;

public interface RoleService<R> {
    R findByRoleName(String roleName);
}
