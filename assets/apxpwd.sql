-- Initializes admin password to admin (default installation)
-- This was hacked from apxchpwd.sql script (from Oracle Corp)

col user_id       noprint new_value M_USER_ID
select rtrim(min(user_id))       user_id
  from wwv_flow_fnd_user
 where security_group_id = 10
   and user_name         = 'ADMIN'
/

declare
    c_user_id  constant number         := to_number( '&M_USER_ID.' );
    c_username constant varchar2(4000) := 'ADMIN';
    c_email    constant varchar2(4000) := 'null@null.com';
    c_password constant varchar2(4000) := 'ADMIN';

    c_old_sgid constant number := wwv_flow_security.g_security_group_id;
    c_old_user constant varchar2(255) := wwv_flow_security.g_user;

    procedure cleanup
    is
    begin
        wwv_flow_security.g_security_group_id := c_old_sgid;
        wwv_flow_security.g_user              := c_old_user;
    end cleanup;
begin
    wwv_flow_security.g_security_group_id := 10;
    wwv_flow_security.g_user              := c_username;

    wwv_flow_fnd_user_int.create_or_update_user( p_user_id  => c_user_id,
                                                 p_username => c_username,
                                                 p_email    => c_email,
                                                 p_password => c_password );

    commit;
    cleanup();
exception
    when others then
        cleanup();
        raise;
end;
/
exit;
