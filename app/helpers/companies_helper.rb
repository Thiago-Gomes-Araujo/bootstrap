module CompaniesHelper
    def dynamic_url
        if current_user.company.present?
            edit_company_path(current_user.company)
        else
            new_company_path
        end
    end
end
