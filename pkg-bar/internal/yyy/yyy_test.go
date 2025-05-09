package yyy_test

import (
	"testing"

	"github.com/aileron-project/_scripts/pkg-bar/internal/yyy"
)

func TestFuncYYY(t *testing.T) {
	if yyy.FuncYYY() != "yyy" {
		t.Error("fail")
	}
}
