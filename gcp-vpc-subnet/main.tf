module "vpc" {
    source  = "/home/arunkumar/terraform-modules/gcp-vpc-subnet/arun"

    project_id   = "robust-form-362412"
    network_name = "dev-vpc"
    routing_mode = "REGIONAL"

    subnets = [
        {
            subnet_name           = "public-subnet-01"
            subnet_ip             = "10.10.10.0/24"
            subnet_region         = "asia-south1"
        },
        {
            subnet_name           = "private-subnet-01"
            subnet_ip             = "10.10.20.0/24"
            subnet_region         = "asia-south1"
            subnet_private_access = "true"
            subnet_flow_logs      = "true"
            description           = "This subnet has a description"
        },
        {
            subnet_name           = "private-subnet-02"
            subnet_ip             = "10.10.22.0/24"
            subnet_region         = "asia-south1"
            subnet_private_access = "true"
            subnet_flow_logs      = "true"
            description           = "This subnet has a description"
        }
    ]

    secondary_ranges = {
        public-subnet-01 = [
            {
                range_name    = "public-subnet-01-secondary-01"
                ip_cidr_range = "10.176.0.0/14"
            },
            {
                range_name    = "public-subnet-01-secondary-02"
                ip_cidr_range = "10.180.0.0/20"
            },
        ]
        private-subnet-02 = [
            {
                range_name    = "private-subnet-01-secondary-01"
                ip_cidr_range = "10.56.0.0/14"
            },
            {
                range_name    = "private-subnet-02-secondary-02"
                ip_cidr_range = "10.60.0.0/20"
            },
        ]
    }

}
