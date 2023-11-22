package util

import (
	"time"

	"github.com/spf13/viper"
)

type Config struct {
	DBSource             string        `mapstructure:"DB_SOURCE"`
	DBDriver             string        `mapstructure:"DB_DRIVER"`
	HTTPServerAddress    string        `mapstructure:"HTTP_SERVER_ADDRESS"`
	GRPCServerAddress    string        `mapstructure:"GRPC_SERVER_ADDRESS"`
	Environment          string        `mapstructure:"ENVIRONMENT"`
	LogOutput            string        `mapstructure:"LOG_OUTPUT"`
	TokenPrivateKeyHex   string        `mapstructure:"TOKEN_PRIVATEKEY_HEX"`
	MigrationURL         string        `mapstructure:"MIGRATION_URL"`
	SMTPAddress          string        `mapstructure:"SMTP_ADDRESS"`
	SMTPPassword         string        `mapstructure:"SMTP_PASSWORD"`
	SMTPMail             string        `mapstructure:"SMTP_MAIL"`
	MigrationRetries     int           `mapstructure:"MIGRATION_RETRIES"`
	Swagger              bool          `mapstructure:"SWAGGER"`
	AccessTokenDuration  time.Duration `mapstructure:"ACCESS_TOKEN_DURATION"`
	RefreshTokenDuration time.Duration `mapstructure:"REFRESH_TOKEN_DURATION"`
}

func LoadConfig(path string) (config Config, err error) {
	viper.AddConfigPath(path)
	viper.SetConfigName("app")
	viper.SetConfigType("env")

	viper.AutomaticEnv()

	err = viper.ReadInConfig()
	if err != nil {
		return
	}

	err = viper.Unmarshal(&config)
	return
}
