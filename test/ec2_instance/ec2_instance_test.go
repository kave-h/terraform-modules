package test

import (
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
	"testing"
)

func TestEC2InstanceModule(t *testing.T) {
	t.Parallel()

	terraformOptions := &terraform.Options{
		// The path to where our Terraform code is located
		TerraformDir: "../../examples/ec2_instance",
		NoColor:      true,
	}

	// Clean up resources at the end of the test
	defer terraform.Destroy(t, terraformOptions)

	// This will init and apply the resources and fail the test if there are any errors
	terraform.InitAndApply(t, terraformOptions)

	// Fetch outputs and assert they exist
	publicIP := terraform.Output(t, terraformOptions, "public_ip")
	sshCommand := terraform.Output(t, terraformOptions, "ssh_command")

	// Assert the outputs are what we expect
	assert.NotEmpty(t, publicIP, "Expected public IP to be non-empty")
	assert.Contains(t, sshCommand, "ssh", "Expected ssh_command to include 'ssh'")
}
