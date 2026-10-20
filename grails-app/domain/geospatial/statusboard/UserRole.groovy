package geospatial.statusboard

import grails.compiler.GrailsCompileStatic
import grails.gorm.DetachedCriteria
import groovy.transform.ToString
import org.codehaus.groovy.util.HashCodeHelper

@GrailsCompileStatic
@ToString(cache = true, includeNames = true, includePackage = false)
class UserRole implements Serializable {

    private static final long serialVersionUID = 1L

    User user
    Role role

    @Override
    boolean equals(Object other) {
        other instanceof UserRole &&
            other.userId == user?.id &&
            other.roleId == role?.id
    }

    @Override
    int hashCode() {
        int hashCode = HashCodeHelper.initHash()

        if (user) {
            hashCode = HashCodeHelper.updateHash(hashCode, user.id)
        }

        if (role) {
            hashCode = HashCodeHelper.updateHash(hashCode, role.id)
        }

        hashCode
    }

    static UserRole get(long userId, long roleId) {
        criteriaFor(userId, roleId).get()
    }

    static boolean exists(long userId, long roleId) {
        criteriaFor(userId, roleId).count() > 0
    }

    private static DetachedCriteria<UserRole> criteriaFor(long userId, long roleId) {
        UserRole.where {
            user == User.load(userId) &&
                role == Role.load(roleId)
        }
    }

    static UserRole create(User user, Role role, boolean flush = false) {
        UserRole instance = new UserRole(user: user, role: role)
        instance.save(flush: flush)
        instance
    }

    static boolean remove(User u, Role r) {
        if (u == null || r == null) {
            return false
        }

        UserRole.where {
            user == u &&
                role == r
        }.deleteAll() > 0
    }

    static int removeAll(User u) {
        u == null ? 0 : UserRole.where { user == u }.deleteAll() as int
    }

    static int removeAll(Role r) {
        r == null ? 0 : UserRole.where { role == r }.deleteAll() as int
    }

    static constraints = {
        user nullable: false
        role nullable: false, validator: { Role role, UserRole userRole ->
            if (userRole.user?.id && role?.id && UserRole.exists(userRole.user.id, role.id)) {
                return ['userRole.exists']
            }
        }
    }

    static mapping = {
        table 'GSB_USER_ROLE'
        id composite: ['user', 'role']
        user column: 'user_id'
        role column: 'role_id'
        version false
    }
}
